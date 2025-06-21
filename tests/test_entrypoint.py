from pathlib import Path

from asreviewcontrib.makita.entrypoint import MakitaEntryPoint

datasets_location = str(Path("tests", "test_data").resolve())


def get_job_file(project_path):
    """
    Helper to detect whether Makita produced a 'jobs.sh' or 'jobs.bat' file.
    """
    sh_file = project_path / "jobs.sh"
    if sh_file.exists():
        return sh_file
    return project_path / "jobs.bat"


def test_basic_template(tmp_path):
    """Test 'basic' template with an existing data folder."""
    mep = MakitaEntryPoint()
    project_folder = tmp_path / "basic_project"

    argv = [
        "template",
        "basic",
        "--project-folder",
        str(project_folder),
        "--data-folder",
        datasets_location,
        "--overwrite",
        "--n-runs",
        "1",
        "--n-query",
        "10",
    ]
    mep.execute(argv)

    jobs_file = get_job_file(project_folder)
    assert jobs_file.exists(), "Makita did not produce the expected jobs file."
    content = jobs_file.read_text()
    assert "ERROR" not in content, "Found 'ERROR' in the generated job script."


def test_arfi_template(tmp_path):
    """Test 'arfi' template with an existing data folder."""
    mep = MakitaEntryPoint()
    project_folder = tmp_path / "arfi_project"

    argv = [
        "template",
        "arfi",
        "--project-folder",
        str(project_folder),
        "--data-folder",
        datasets_location,
        "--overwrite",
        "--n-priors",
        "5",
        "--n-query",
        "10",
    ]
    mep.execute(argv)

    jobs_file = get_job_file(project_folder)
    assert jobs_file.exists(), "Makita did not produce the expected jobs file for ARFI."
    content = jobs_file.read_text()
    assert "ERROR" not in content


def test_prior_template(tmp_path):
    """
    Test 'prior' template.
    This requires at least one dataset whose filename begins with
    'prior_' or 'priors_'. Otherwise, it may raise an exception.
    """
    mep = MakitaEntryPoint()
    project_folder = tmp_path / "prior_project"

    argv = [
        "template",
        "prior",
        "--project-folder",
        str(project_folder),
        "--data-folder",
        datasets_location,
        "--overwrite",
        "--n-runs",
        "1",
        "--n-query",
        "10",
    ]
    mep.execute(argv)

    jobs_file = get_job_file(project_folder)
    assert jobs_file.exists(), (
        "Makita did not produce the expected jobs file for prior."
    )
    content = jobs_file.read_text()
    assert "ERROR" not in content


def test_modelmatrix_template(tmp_path):
    """Test 'modelmatrix' template with an existing data folder."""
    mep = MakitaEntryPoint()
    project_folder = tmp_path / "modelmatrix_project"

    argv = [
        "template",
        "modelmatrix",
        "--project-folder",
        str(project_folder),
        "--data-folder",
        datasets_location,
        "--overwrite",
        "--n-runs",
        "1",
        "--n-query",
        "10",
    ]
    mep.execute(argv)

    jobs_file = get_job_file(project_folder)
    assert jobs_file.exists(), (
        "Makita did not produce the expected jobs file for modelmatrix."
    )
    content = jobs_file.read_text()
    assert "ERROR" not in content


def test_add_script(tmp_path):
    """
    Test the 'add-script' subcommand with --all,
    storing generated scripts in a separate folder.
    """
    mep = MakitaEntryPoint()
    scripts_folder = tmp_path / "scripts_output"

    argv = [
        "add-script",
        "--all",
        "--output",
        str(scripts_folder),
    ]
    mep.execute(argv)

    # Ensure scripts were created in scripts_folder.
    assert scripts_folder.exists() and any(scripts_folder.iterdir()), (
        "No scripts were created by add-script."
    )
